contract c16850{
    /*
     * @dev generate a true random num, two methods are provide, to avoid single point failure
     *      randomGenerateMethod = 0 - random num generate from random.org
     *      randomGenerateMethod = 1 - random num generate from oraclize service
     * @return oraclize queryId
     */
    function generateRandomNum() internal returns(bytes32){
        /* random num solution from random.org */
        if (randomGenerateMethod == 0){
                randomQueryID += 1;
                string memory queryString1 = "[URL] ['json(https://api.random.org/json-rpc/1/invoke).result.random[\"serialNumber\",\"data\"]', '\\n{\"jsonrpc\":\"2.0\",\"method\":\"generateSignedIntegers\",\"params\":{\"apiKey\":";
                string memory queryString1_1 = ",\"n\":1,\"min\":1,\"max\":100,\"replacement\":true,\"base\":10${[identity] \"}\"},\"id\":";
                queryString1 = queryString1.toSlice().concat(randomApiKey.toSlice());
                queryString1 = queryString1.toSlice().concat(queryString1_1.toSlice());
                string memory queryString2 = uint2str(randomQueryID);
                string memory queryString3 = "${[identity] \"}\"}']";
                string memory queryString1_2 = queryString1.toSlice().concat(queryString2.toSlice());
                string memory queryString1_2_3 = queryString1_2.toSlice().concat(queryString3.toSlice()); 
                oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
                return oraclize_query("nested", queryString1_2_3, gasForOraclize);               
        }
        /* random num solution from oraclize(by default), prove fair paper: http://www.oraclize.it/papers/random_datasource-rev1.pdf */
        if (randomGenerateMethod == 1){
                randomQueryID += 1;
                uint N = 8; /* number of random bytes we want the datasource to return */
                uint delay = 0; /* number of seconds to wait before the execution takes place */
                oraclize_setProof(proofType_Ledger);
                return oraclize_newRandomDSQuery(delay, N, gasForOraclize); /* this function internally generates the correct oraclize_query and returns its queryId */
        }
    }
}