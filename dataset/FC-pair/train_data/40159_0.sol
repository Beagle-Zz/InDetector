contract c40159{
     
    modifier onlywizard() { if (msg.sender == wizardAddress) _; }
}