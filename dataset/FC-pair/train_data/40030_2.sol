contract c40030{
              
    function grantKudos(address userToGrant, uint reason) onlyOwner {
        UserInfo user = users[userToGrant];
        if (user.kudosLimit == 0) throw;  
        if (reason != GRANT_REASON_FACEBOOK &&         
            reason != GRANT_REASON_TWITTER) throw;     
         
         
         
        if (user.isJudge) throw;
         
        if (user.grant[reason]) throw;
         
        user.kudosLimit += SOCIAL_PROOF_KUDOS;
        user.grant[reason] = true;
    }
}