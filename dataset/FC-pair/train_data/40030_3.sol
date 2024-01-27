contract c40030{
     
     
     
     
    function getProjectKudos(bytes32 projectCode) constant returns(uint) {
        ProjectInfo project = projects[projectCode];
        return project.kudosTotal;
    }
}