contract c40012{
     
    modifier onlyClient {if (msg.sender != client) throw; _;}
}