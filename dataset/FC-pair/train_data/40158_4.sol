contract c40158{
     
    modifier onlywizard() { if (msg.sender == wizardAddress) _; }
}