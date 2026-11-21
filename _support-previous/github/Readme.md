This folder contains a typical file that defines a workflow.


By default we just call the centralized builder proposed by the bookbuilderdashboard project.


```
name: Book with Pillar

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  schedule:
    - cron:  '0 0 * * 0'

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

jobs:
  build:
    uses: SquareBracketAssociates/BookBuilderDashboard/.github/workflows/main.yml@newVersionOfPillar
    with:
      bookname: MyBook

```


The centralized builder logic is around the following logic that we give here as documentation

```
on: 
  workflow_call:
    inputs:
      bookname:
        description: 'Filename of the book to be built (e.g. mybook)'
        required: true
        type: string
        
jobs:
  build:
    runs-on: ubuntu-latest
    env:
      TEXLIVE_RELEASE: '2023'
    
    steps:

      - uses: actions/checkout@v3

      - name: Set PATH
        run: |
          echo "${{ github.workspace }}/build" >> $GITHUB_PATH
          echo "$HOME/texlive/bin/x86_64-linux" >> $GITHUB_PATH

      - name: Prepare Pillar
        run: |
          git clone https://github.com/pillar-markup/pillar.git -b v10.1.0
          ./pillar/scripts/build.sh

      - name: Prepare TeXlive
        run: |
          ./_support/latex/sbabook/ci/install-texlive

      - name: Install SBA TeXlive Dependencies
        run: |
          xargs tlmgr install < ./_support/latex/sbabook/texlive.deps

      - name: Install Pillar Template TeXlive Dependencies
        run: |
          xargs tlmgr install < ./_support/latex/texlive.deps

      - name: Build PDF
        run: |
          pillar build pdf index.*
          mkdir -p artifacts
          mv _result/pdf/index.pdf "artifacts/${{ inputs.bookname }}.pdf"

      - name: Continuous Release
        if: ${{ github.event_name == 'push' }}
        uses: "marvinpinto/action-automatic-releases@latest"
        with:
          repo_token: "${{ secrets.GITHUB_TOKEN }}"
          automatic_release_tag: "latest"
          prerelease: true
          title: "Development Build"
          files: |
            artifacts/*.pdf
```