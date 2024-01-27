contract c8372{
  // =========================================================
  // Crowdsale Stage Management
  // =========================================================
  // Change Crowdsale Stage. Available Options: PreICO, ICO1, ICO2, ICO3, ICO4
    function setCrowdsaleStage(uint value) public onlyOwner {
        require(value <= 4);
        if (uint(CrowdsaleStage.PreICO) == value) {
            rate = 2380; // 1 EPG = 0.00042 ETH
            stage = CrowdsaleStage.PreICO;
        } else if (uint(CrowdsaleStage.ICO1) == value) {
            rate = 2040; // 1 EPG = 0.00049 ETH
            stage = CrowdsaleStage.ICO1;
        }
        else if (uint(CrowdsaleStage.ICO2) == value) {
            rate = 1785; // 1 EPG = 0.00056 ETH
            stage = CrowdsaleStage.ICO2;
        }
        else if (uint(CrowdsaleStage.ICO3) == value) {
            rate = 1587; // 1 EPG = 0.00063 ETH
            stage = CrowdsaleStage.ICO3;
        }
        else if (uint(CrowdsaleStage.ICO4) == value) {
            rate = 1503; // 1 EPG = 0.000665 ETH
            stage = CrowdsaleStage.ICO4;
        }
    }
}