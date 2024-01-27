contract c3253{
    // deploy a new contract
    function newPaymentAddress(address _collector)
        public
        returns(address newContract)
    {
        PaymentAddress paymentAddress = new PaymentAddress(_collector);
        paymentAddresses[_collector].push(paymentAddress);
        addContract(paymentAddress);
        return paymentAddress;
    }
}