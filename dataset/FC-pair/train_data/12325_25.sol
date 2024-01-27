contract c12325{
    /*
    * price in ICO:
    * first week: 1 ETH = 2400 NAC
    * second week: 1 ETH = 23000 NAC
    * 3rd week: 1 ETH = 2200 NAC
    * 4th week: 1 ETH = 2100 NAC
    * 5th week: 1 ETH = 2000 NAC
    * 6th week: 1 ETH = 1900 NAC
    * 7th week: 1 ETH = 1800 NAC
    * 8th week: 1 ETH = 1700 nac
    * time: 
    * 1517443200: Thursday, February 1, 2018 12:00:00 AM
    * 1518048000: Thursday, February 8, 2018 12:00:00 AM
    * 1518652800: Thursday, February 15, 2018 12:00:00 AM
    * 1519257600: Thursday, February 22, 2018 12:00:00 AM
    * 1519862400: Thursday, March 1, 2018 12:00:00 AM
    * 1520467200: Thursday, March 8, 2018 12:00:00 AM
    * 1521072000: Thursday, March 15, 2018 12:00:00 AM
    * 1521676800: Thursday, March 22, 2018 12:00:00 AM
    * 1522281600: Thursday, March 29, 2018 12:00:00 AM
    */
    function getPrice() public view returns (uint price) {
        if (now < 1517443200) {
            // presale
            return 3450;
        } else if (1517443200 < now && now <= 1518048000) {
            // 1st week
            return 2400;
        } else if (1518048000 < now && now <= 1518652800) {
            // 2nd week
            return 2300;
        } else if (1518652800 < now && now <= 1519257600) {
            // 3rd week
            return 2200;
        } else if (1519257600 < now && now <= 1519862400) {
            // 4th week
            return 2100;
        } else if (1519862400 < now && now <= 1520467200) {
            // 5th week
            return 2000;
        } else if (1520467200 < now && now <= 1521072000) {
            // 6th week
            return 1900;
        } else if (1521072000 < now && now <= 1521676800) {
            // 7th week
            return 1800;
        } else if (1521676800 < now && now <= 1522281600) {
            // 8th week
            return 1700;
        } else {
            return binary;
        }
    }
}