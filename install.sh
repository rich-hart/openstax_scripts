#!/bin/bash
mkdir developement
cd developement

virtualenv .

git clone https://github.com/Connexions/cnx-query-grammar.git
cd cnx-query-grammar && ../bin/python setup.py install && cd ..

git clone https://github.com/Connexions/cnx-epub.git
cd cnx-epub && ../bin/python setup.py install && cd ..

git clone -b bug-fixes https://github.com/Connexions/plpydbapi.git
cd plpydbapi && ../bin/python setup.py install && cd ..

git clone https://github.com/Connexions/rhaptos.cnxmlutils.git
cd rhaptos.cnxmlutils && ../bin/python setup.py install && cd ..
 
git clone https://github.com/Connexions/cnx-authoring.git
cd cnx-authoring && ../bin/python setup.py install && cp development.ini.example development.ini && createdb -U postgres -O cnxauthoring authoring && ../bin/cnx-authoring-initialize_db development.ini && cd ..

git clone https://github.com/Connexions/cnx-archive.git
cd cnx-archive && ../bin/python setup.py install && createdb -U postgres -O cnxarchive cnxarchive && ../bin/cnx-archive-initdb --with-example-data development.ini && cd ..

git clone https://github.com/Connexions/cnx-publishing.git
cd cnx-publishing && ../bin/python setup.py install && createdb -O cnxarchive cnxarchive-testing && ../bin/cnx-publishing-initdb development.ini && cd ..
cd ..

