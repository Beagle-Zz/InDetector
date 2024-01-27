contract c40012{
     
    modifier onlyDao {if (recipient != 0) throw; _;}
}