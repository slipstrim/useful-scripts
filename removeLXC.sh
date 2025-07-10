#!/bin/bash

start=201
end=230

        for i in `seq $start $end`;
        do
                echo "Progress $i"
                
                pct stop $i
                pct destroy $i
        done