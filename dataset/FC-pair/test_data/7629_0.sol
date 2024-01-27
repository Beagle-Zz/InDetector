contract c7629{
// Set the score parameter that once reached would eliminate/revoke
// validators with scores greater than _scoreMax from the list of authorized validators
function setScoringThreshold(uint _scoreMax) public onlySuperAdmin
{
  scoringThreshold = _scoreMax ; 
}
}