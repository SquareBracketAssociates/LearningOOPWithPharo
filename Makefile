.DEFAULT_GOAL = help

CHAPTERS = \
	Chapters/Introduction/Introduction \
	Chapters/Tests/Tests \
	Chapters/GettingStarted/GettingStarted \
	Chapters/GettingStarted/ChallengingYourself \
	Chapters/PlayingWithTurtles/PlayingWithTurtles \
	Chapters/Counter/Counter \
	Chapters/Katas/GramKatas \
	Chapters/Katas/GramVariation \
	Chapters/Converter/Converter \
	Chapters/Converter/Converter2 \
	Chapters/Wallet/Wallet \
	Chapters/DSL/DSL \
	Chapters/TinyChat/TinyChat \
	Chapters/SnakesAndLadders/SnakesAndLadders \
	Chapters/JoeTheBox/JoeTheBox \
	Chapters/PaperStoneScissor/PaperStoneScissor \
	Chapters/DoubleDispatch/DoubleDispatch \
	Chapters/Inheritance/Inheritance \
	Chapters/Inheritance/Extending \
	Chapters/SyntaxGlimpse/SyntaxGlimpse \
	Chapters/Expressions/Expressions \
	Chapters/SimpleLAN/SimpleLANDefinition \
	Chapters/OOPNutshell/OOPNutshell \
	Chapters/BeaconAndSatellite/BeaconAndSatellite \
	Chapters/Tamagoshi/Tamagoshi \
	Chapters/MessageSending/MessageSending \
	Chapters/Solutions/Solutions \
	Chapters/GettingStarted/ChallengingYourselfSolution \
	Chapters/ObjectsAndClasses/ObjectsAndClasses \
	Chapters/SyntaxNutshell/SyntaxNutshell \

# Redirect to bootstrap makefile if pillar is not found
PILLAR ?= $(wildcard pillar)
ifeq (,$(PILLAR))
	include support/makefiles/bootstrap.mk
else
	include support/makefiles/main.mk
endif
