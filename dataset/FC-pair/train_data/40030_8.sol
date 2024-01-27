contract c40030{
     
     
     
     
    function updateUsersIndex(bytes32 code, uint kudos) private {
        UserIndex idx = usersIndex[msg.sender];
        uint i = idx.kudosIdx[code];
         
        if (i == 0) {
            i = idx.projects.length + 1;
            idx.projects.length += 1;
            idx.kudos.length += 1;
            idx.projects[i - 1] = code;
            idx.kudosIdx[code] = i;
        }
        idx.kudos[i - 1] = kudos;
    }
}