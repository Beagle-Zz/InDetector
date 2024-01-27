contract c40030{
     
    function giveKudos(bytes32 projectCode, uint kudos) {
         
        if (now < votePeriod.start) throw;
        if (now >= votePeriod.end) throw;        
        UserInfo giver = users[msg.sender];
        if (giver.kudosGiven + kudos > giver.kudosLimit) throw;
        ProjectInfo project = projects[projectCode];
        giver.kudosGiven += kudos;
        project.kudosTotal += kudos;
        project.kudosByUser[msg.sender] += kudos;
         
        updateUsersIndex(projectCode, project.kudosByUser[msg.sender]);
        Vote(msg.sender, projectCode, kudos);
    }
}