#!/usr/bin/env bash
#source /home/devu/.rvm/gems/ruby-2.1.5/bin:
echo "starting deployment"
array=( daasa kagga sarvajna kaviraja )
for i in "${array[@]}"
do
echo "=========================> Deploying to" $i "started <========================="
                                           cap $i deploy
echo "=========================> Deploying to" $i "finished <========================="
done

