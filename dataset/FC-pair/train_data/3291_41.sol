contract c3291{
  // function for whitelisting investors with caps
  function setCapForParticipants(address[] participants, uint256[] caps) onlyWhitelisted public  {
    require(participants.length <= 50 && participants.length == caps.length);
    for (uint8 i=0; i < participants.length; i++) {
      investorCaps[participants[i]] = caps[i];
    }
  }
}