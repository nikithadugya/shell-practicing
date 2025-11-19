#!/bin/bash
# here we are not declaring the variable but just calling it so in Mobxterm session we will declare the vraiable by export $COURSE = "something" 
#but this will go after session expiry so we declare in the ./bashrc file add export course = " " so that evrytime the session starts it runs the ./bashrc file so env variable also will exist.
echo "Course name  is : $COURSE"