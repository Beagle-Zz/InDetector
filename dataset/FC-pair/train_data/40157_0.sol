contract c40157{
     
    modifier onlywizard() { if (msg.sender == wizardAddress) _; }
}