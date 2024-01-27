contract c2780{
    /**
     * @dev get ICO times
     * @return presale_start, presale_end, ico_start, ico_phase_1_end, ico_phase_2_end, ico_phase_3_end, ico_phase_4_end, ico_phase_5_end
     */
    function getTimes() public view returns (uint, uint, uint, uint, uint, uint, uint, uint) {
        return (presale_start, presale_end, ico_start, ico_phase_1_end, ico_phase_2_end, ico_phase_3_end, ico_phase_4_end, ico_phase_5_end);
    }
}