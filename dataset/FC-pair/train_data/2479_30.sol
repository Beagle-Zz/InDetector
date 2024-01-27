contract c2479{
    // If _fallback is true, then for STO module type we only allow the module if it is set, if it is not set we only allow the owner
    // for other _moduleType we allow both issuer and module.
    modifier onlyModule(uint8 _moduleType, bool _fallback) {
      //Loop over all modules of type _moduleType
        bool isModuleType = false;
        for (uint8 i = 0; i < modules[_moduleType].length; i++) {
            isModuleType = isModuleType || (modules[_moduleType][i].moduleAddress == msg.sender);
        }
        if (_fallback && !isModuleType) {
            if (_moduleType == STO_KEY)
                require(modules[_moduleType].length == 0 && msg.sender == owner, "Sender is not owner or STO module is attached");
            else
                require(msg.sender == owner, "Sender is not owner");
        } else {
            require(isModuleType, "Sender is not correct module type");
        }
        _;
    }
}