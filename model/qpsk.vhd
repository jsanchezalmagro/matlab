-- -----------------------------------------------------------------------------
-- Convert to complemto to two
--       bit_I/Q = 1 then the value is 0x7FFF or +1.0
--       bit_I/Q = 0 then the value is 0x8001 or -1.0
-- -----------------------------------------------------------------------------
m_tdata_i <= c_qpsk_amp_pos when (b_dout(0) = '0') else c_qpsk_amp_neg; -- Symbol I
m_tdata_q <= c_qpsk_amp_pos when (b_dout(1) = '0') else c_qpsk_amp_neg; -- Symbol Q
m_tdata   <= m_tdata_q & m_tdata_i;                                     -- Symbol Q/I
-- -----------------------------------------------------------------------------
