#!/bin/bash
FOLDER=$1 # Root folder that is being backed up"
cd $FOLDER
echo "Backing up directory $FOLDER"
for DIR in `ls $FOLDER` # Dir is the individual repositories
  do
    BACKUPDIR=$FOLDER/.backup/$DIR # Folder that will hold a copy of the repositories
    echo "Copying files into $BACKUPDIR"
    if [ -e $BACKUPDIR ] 
      then
        echo "Backing up $DIR into $BACKUPDIR"
        cp -r $DIR/* $BACKUPDIR
        cd $BACKUPDIR
        echo "Git adding"
        git add *
        echo "Git committing"
        git commit -m "backup for `date +_%d_%m_%y`"
        echo "Git pushing"
        git push origin master
        echo "Done, exiting folder"
        cd $FOLDER
    fi
done
cd $PWD


