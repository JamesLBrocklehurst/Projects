#!/bin/bash

age=25

if [ $age -gt 18 ]
then
    # Code block to be execited
    echo "You are an adult."
fi


# && = AND
# || = OR


grade=95

if [ $grade -ge 90 ] && [ $grade -le 100 ]
then
    # Code block to be execited
    echo "Excellent!"
fi


name="Tim"

if [ "$name" == "Tim" ] 
then 
    # Code block to be execited
    echo "Hello, Tim!"
fi

if [ $age -gt 28 ] 
then
    # Code block to be execited if the condition is true!
    echo "You are an adult."
else
    # Code block to be execited if the condition is false!
    echo "You are not an adult."
fi

score=85

if [ $score -ge 90 ]
then 
    # Code block to be execited if the first condition is true!
    echo "Excellent!"
elif [ $score -ge 80 ]
then
    # Code block to be execited if the second condition is true!
    echo "Good!"
else
    # Code block to be execited if all conditions are false!
    echo "Better luck next time!"
fi

