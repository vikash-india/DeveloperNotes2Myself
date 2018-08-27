#!/bin/bash

#BEGINHELP#
#
# Usage: migratedata.sh -full
#        migratedata.sh -clean
# Purpose:
#   Database Migration utility. Before running, please ensure
#   that the database parameters are properly set in this file.
# Description:
#   Option "-full" loads the full data into the database
#   Option "-cleanup" removes all the nigrated data
#
#ENDHELP#

# Ensure that the following database parameters are properly set
# KuberaVault Related
HOST=localhost
USER=root
PASSWORD=root
DB=kubera
WMFDB=hexagon

usage()
{
    sed -n '/^#BEGINHELP#/,/^#ENDHELP#/p' $0 | sed -e 1d -e '$d' -e 's/^#//' 1>&2
    exit 1
}

delete_hexagon_data()
{
    echo "Deleting hexagon data..."
    # For MF Transactions


    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD   -e "delete from kubera.k_mf_acc_xns where xn_id >=8001;"
    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD   -e "delete from kubera.k_user_accounts where acc_id >=2001 and acc_id <=3089;"

    # For Client Master
    mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "delete from hexagon.clientbank;"
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "delete from hexagon.clientmaster where client_id >=1001 and client_id <=2089;"
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "delete from hexagon.clientgroups where group_id > 10;"
    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD      -e "delete from k_user_info where user_id >=1001 and user_id <=2089;"
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "delete from hexagon.clientsourcedetails;"

    # For Employee
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "delete from hexagon.employeemaster where id >=101 and id <=150;"
    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD      -e "delete from k_user_info where user_id >=901 and user_id <=950;"
    
    # City Master
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "delete from CityMaster;"

    echo "Done"
}

load_hexagon_data()
{
    echo "Migrating Hexagon data..."
    
    # City Master
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "load data local infile 'DataPerfios/hexagon_CityMaster.txt' into table hexagon.citymaster;"
    
    # Insert One more record for City Master as the defualt Code. Client Master has data related to this
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "insert into hexagon.citymaster(CityCode,CityName,STDCode,StateName,CountryName) values (101,'Undefined',null,'Undefined','Undefined');"

    # For Employees
    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD      -e "load data local infile 'DataPerfios/perfios_k_user_info_Employee.txt' into table kubera.k_user_info;"      
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "load data local infile 'DataPerfios/hexagon_EmployeeMaster.txt' into table hexagon.EmployeeMaster;"
    
    # For Client Master
    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD      -e "load data local infile 'DataPerfios/perfios_k_user_info.txt' into table kubera.k_user_info;"
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "load data local infile 'DataPerfios/hexagon_ClientSourceDetails.txt' into table hexagon.clientsourcedetails;"
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "load data local infile 'DataPerfios/hexagon_clientmaster.txt' into table hexagon.ClientMaster;"
    #mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "load data local infile 'DataPerfios/hexagon_ClientGroups.txt' into table hexagon.ClientGroups;"
    mysql -h $HOST -D $WMFDB -u $USER -p$PASSWORD   -e "load data local infile 'DataPerfios/hexagon_ClientBank.txt' into table hexagon.ClientBank;"
    
    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD      -e "load data local infile 'DataPerfios/pefios_k_user_accounts.txt' into table kubera.k_user_accounts;"
    #mysql -h $HOST -D $DB -u $USER -p$PASSWORD      -e "load data local infile 'DataPerfios/perfios_k_mf_acc_xns.txt' into table kubera.k_mf_acc_xns;"

    echo "Done"
}

if [ $# -eq 0 ]
then
    usage
fi

opt=$1; shift
if [ x"$opt" = x"-full" ]
then
    load_hexagon_data
elif [ x"$opt" = x"-clean" ]
then
    delete_hexagon_data
else
    show_error "Illegal option $opt"
fi
