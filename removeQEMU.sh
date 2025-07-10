#!/bin/bash

start=301
end=330

        for i in `seq $start $end`;
        do
                echo "Progress $i"

		qm stop $i
		qm destroy $i
        done   