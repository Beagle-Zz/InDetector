contract c13331{
    // Change the address for the specified role.
    // Available to any wallet owner except the observer.
    // Available to the manager until the round is initialized.
    // The Observer's wallet or his own manager can change at any time.
    // @ Do I have to use the function      no
    // @ When it is possible to call        depend...
    // @ When it is launched automatically  -
    // @ Who can call the function          staff (all 7+ roles)
    function changeWallet(address _wallet, uint8 _role) external {
        require(wallets[_role][0] == msg.sender || wallets[0][0] == msg.sender || (wallets[1][0] == msg.sender && managerPowerful /* && _role != 0*/));
        emit WalletChanged(wallets[_role][0],_wallet,_role);
        uint16 roleMask = uint16(2)**_role;
        address[] storage tmp = wallets[_role];
        for(uint8 i = 0; i < tmp.length; i++){
            roles[tmp[i]] = roles[tmp[i]]&~roleMask;
        }
        delete  wallets[_role];
        tmp.push(_wallet);
        roles[_wallet] = roles[_wallet]|roleMask;
    }
}