#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/code

# Personal
git clone git@github.com:Lumine-media/sermons-back-end.git $CODE/sermons-backend
git clone git@github.com:veekthoven/mailerlite-test.git $CODE/mailerlite-test
git clone git@github.com:veekthoven/lightwk-new.git $CODE/lightwk
git clone git@github.com:veekthoven/veekthoven.git $CODE/veekthoven

# Work
git clone git@github.com:The-Lesson-Builder-LLC/myworksheetmaker.git $CODE/myworksheetmaker
git clone git@github.com:The-Lesson-Builder-LLC/mywordsearch.git $CODE/mywordsearch
git clone git@github.com:The-Lesson-Builder-LLC/crosswordhobbyist.git $CODE/mywordsearch

echo "Done cloning repositories"