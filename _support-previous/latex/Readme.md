This folder contains the sbabook template and the local addition of the pillar template. 

### SBA

As a general principle the sbabook is read-only and it is managed by cloning 
	https://github.com/cdlm/sbabook

Now due to the weakness of git subrepo it is difficult to assess whether the files have been modified. 
Our experiments show the contrary and shed a bad light on the use of subrepo. 
The following expression may be useful (we are not convinced)

```
git subrepo pull --force --branch=v0.2.8 archetypes/bod-book/support/latex/sbabook
```
Pay attention this expression and the git subpo status do not give information whether files have been modified!

### Local customisation and addition
	
	Edit the file /support/latex/texlive.deps to introduce any LaTeX package that you would need.
	By default we use
		amsmath
		import
		ulem 
		
Have fun 



