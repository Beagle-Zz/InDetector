contract c40030{
     
    function getProjectKudosByUsers(bytes32 projectCode, address[] users) constant returns(uint[]) {
        ProjectInfo project = projects[projectCode];
        mapping(address => uint) kudosByUser = project.kudosByUser;
        uint[] memory userKudos = new uint[](users.length);
        for (uint i = 0; i < users.length; i++) {
            userKudos[i] = kudosByUser[users[i]];
       }
       return userKudos;
    }
}