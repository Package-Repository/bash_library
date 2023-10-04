remove_suffix() 
{
  local input_string="$1"
  local suffix="_node"

  if [[ "$input_string" == *"$suffix" ]]; then
    trimmed_string="${input_string%"$suffix"}"
  fi
  echo "$trimmed_string"
}

append_data_suffix() 
{
  local input_string="$1"
  local suffix="_data"
  local new_string="${input_string}${suffix}"
  echo "$new_string"
}

append_exec_suffix() 
{
  local input_string="$1"
  local suffix="_exec"
  local new_string="${input_string}${suffix}"
  echo "$new_string"
}

append_sub_suffix() 
{
  local input_string="$1"
  local suffix="_sub"
  local new_string="${input_string}${suffix}"
  echo "$new_string"
}