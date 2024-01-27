contract c40014{
     
    modifier onlyClient {if (msg.sender != client) throw; _;}
}