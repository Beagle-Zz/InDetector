contract c2310{
    // We accept payments other than Ethereum (ETH) and other currencies, for example, Bitcoin (BTC).
    // Perhaps other types of cryptocurrency - see the original terms in the white paper and on the TokenSale website.
    // We release tokens on Ethereum. During the Round1 and Round2 with a smart contract, you directly transfer
    // the tokens there and immediately, with the same transaction, receive tokens in your wallet.
    // When paying in any other currency, for example in BTC, we accept your money via one common wallet.
    // Our manager fixes the amount received for the bitcoin wallet and calls the method of the smart
    // contract paymentsInOtherCurrency to inform him how much foreign currency has been received - on a daily basis.
    // The smart contract pins the number of accepted ETH directly and the number of BTC. Smart contract
    // monitors softcap and hardcap, so as not to go beyond this framework.
    // In theory, it is possible that when approaching hardcap, we will receive a transfer (one or several
    // transfers) to the wallet of BTC, that together with previously received money will exceed the hardcap in total.
    // In this case, we will refund all the amounts above, in order not to exceed the hardcap.
    // Collection of money in BTC will be carried out via one common wallet. The wallet's address will be published
    // everywhere (in a white paper, on the TokenSale website, on Telegram, on Bitcointalk, in this code, etc.)
    // Anyone interested can check that the administrator of the smart contract writes down exactly the amount
    // in ETH (in equivalent for BTC) there. In theory, the ability to bypass a smart contract to accept money in
    // BTC and not register them in ETH creates a possibility for manipulation by the company. Thanks to
    // paymentsInOtherCurrency however, this threat is leveled.
    // Any user can check the amounts in BTC and the variable of the smart contract that accounts for this
    // (paymentsInOtherCurrency method). Any user can easily check the incoming transactions in a smart contract
    // on a daily basis. Any hypothetical tricks on the part of the company can be exposed and panic during the TokenSale,
    // simply pointing out the incompatibility of paymentsInOtherCurrency (ie, the amount of ETH + BTC collection)
    // and the actual transactions in BTC. The company strictly adheres to the described principles of openness.
    // The company administrator is required to synchronize paymentsInOtherCurrency every working day (but you
    // cannot synchronize if there are no new BTC payments). In the case of unforeseen problems, such as
    // brakes on the Ethereum network, this operation may be difficult. You should only worry if the
    // administrator does not synchronize the amount for more than 96 hours in a row, and the BTC wallet
    // receives significant amounts.
    // This scenario ensures that for the sum of all fees in all currencies this value does not exceed hardcap.
    // ** QUINTILLIONS ** 10^18 / 1**18 / 1e18
    // @ Do I have to use the function      no
    // @ When it is possible to call        during active rounds
    // @ When it is launched automatically  every day from cryptob2b token software
    // @ Who can call the function          admins + observer
    function paymentsInOtherCurrency(uint256 _token, uint256 _value) public {
        // **For audit**
        // BTC Wallet:             1D7qaRN6keGJKb5LracZYQEgCBaryZxVaE
        // BCH Wallet:             1CDRdTwvEyZD7qjiGUYxZQSf8n91q95xHU
        // DASH Wallet:            XnjajDvQq1C7z2o4EFevRhejc6kRmX1NUp
        // LTC Wallet:             LhHkiwVfoYEviYiLXP5pRK2S1QX5eGrotA
        require(rightAndRoles.onlyRoles(msg.sender,18));
        bool withinPeriod = (now >= startTime && now <= endTime.add(renewal));
        bool withinCap = _value.add(ethWeiRaised) <= hardCap.add(overLimit);
        require(withinPeriod && withinCap && isInitialized && !isFinalized);
        emit PaymentedInOtherCurrency(_token,_value);
        nonEthWeiRaised = _value;
        tokenReserved = _token;
    }
}