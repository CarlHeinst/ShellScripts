function getportreply ()
{
result=$(nc -zv -w 3 $1 $2 2>&1)
  if [[ "$result" =~ "failed: Connection refused" ]]
  then
      OUTPUT="{\"ipaddress\":\"$1\",\"$3_reply\":\"NULL\"},"
      echo $OUTPUT
  else
      OUTPUT="{\"ipaddress\":\"$1\",\"$3_reply\":\"Success : $result\"},"
      echo $OUTPUT
  fi
};

getportreply $p 22 SSH
getportreply $p 23 Telnet
getportreply $p 161 SNMP
