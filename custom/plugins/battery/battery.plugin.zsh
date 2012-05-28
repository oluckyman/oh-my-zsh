function battery_charge_prompt {
    echo `/usr/bin/python $ZSH_CUSTOM/plugins/battery/batcharge.py` 2>/dev/null
}
