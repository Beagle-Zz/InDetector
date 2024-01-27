contract c40014{
     
    modifier onlyDao {if (recipient != 0) throw; _;}
}