# Network-related Synchronization

* `sync/control`

    - control[31] is the "ARM SOWF" bit (0x80000000).  This bit needs to be set
      on all ROACH2's pretty close to each other (within one SOWF cycle).
      The internal SOWF generator synchronizes to the first external SOWF pulse
      after a rising edge of this bit.

    - control[30] is the "ARM 1PPS" bit (0x40000000).  This bit needs to be set
      on all ROACH2's pretty close to each other (within one 1PPS cycle).
      The internal SOWF generator synchronizes to the first external 1PPS pulse
      after a rising edge of this bit.

    - control[29] is the "Arm MCNT" bit (0x20000000).  This bit needs to be set
      on all ROACH2's pretty close to each other (within one sync cycle).
      The MCNT counter resets on the first sync pulse after a rising edge of
      this bit.

    - control[0] is the "SOWF/1PPS" select bit (0x000000001).  This bit
      specifies which ADC provides SOWF and which ADC provides 1PPS.  If it is
      a `0`, then SOWF is expected via ADC0 and 1PPS is expected via ADC1.  If
      it is a `1`, then 1PPS is expected via ADC0 and SOWF is expected via
      ADC1.

# Network-related Scope Configuration

* `scope/ctrl`

    This register controls the behavior of the "scope" functionality.

    - `ctrl[23:16]` - Sync out select.  A value of 31 (16+15) selects the
      network's [re`cevied?]` sync out signal.  [Really?  Maybe it's just 15?]
    - `ctrl[15:08]` - Snap select 1.  A value of 12 selects the network
      [re`ceived?]` data signals for snapshotting in `scope/snap1`.
    - `ctrl[07:00]` - Snap select 0.  A value of 12 selects the network
      [received?] data signals for snapshotting in `scope/snap0`.

# Network Configuration and Control

* `network/ctrl`

    Control register for network related logic.

    - `ctrl[31]` = 10 GbE Core Reset
    - `ctrl[30]` = RX FIFO Reset
    - `ctrl[ 5]`  = Network TX Enable
    - `ctrl[ 4]`  = Network RX Enable
    - `ctrl[ 0]`  = Bypass control (0=normal; 1=bypass)

* `network/eth/0` to `network/eth/3`

    These are the 10 GbE cores.  They must have the low byte of their IP
    address set to this 8 bit binary value: `0RRR11EE`, where `RRR` is the
    ROACH2 ID (0-7, i.e. basically the same thing as `FID`) and `EE` is the two
    bit core number (0-3).  For example, eth2 (`EE`=10) on `FID`=3 (`RRR`=011)
    would need to have the low byte of its IP address set to: `00111110` =
    `0x3e` = `62`.  The high three bytes of a core's IP address must be set to
    the same value as the high three bytes of network/ipbase.  MAC addresses
    and ARP tables must also be setup accordingly.

     FID   eth0  eth1  eth2  eth3
    ----- ----- ----- ----- -----
      0      12    13    14    15
      1      28    29    30    31
      2      44    45    46    47
      3      60    61    62    63
      4      76    77    78    79
      5      92    93    94    95
      6     108   109   110   111
      7     124   125   126   127

    Table: Last octect of 10 GbE IP adresses for each F engine.

* `network/fid`

    The low 3 bits of this register sets the FID (F engine ID) of the ROACH2.
    This is basically input/antenna number.  Each ROACH2 must have a unique
    value from 0 to 7.

* `network/ipbase`

    The high 24 bits set the first three octets of the destination IP address
    that packets are sent to.  This must match the high 24 bits of the 10 GbE
    cores' IP addresses.

# Network Monitoring

* `network/eth/status`

    Each byte contains 6 status bits from each ethernet core.  The least
    significant byte is port 0. the most significant byte is port 3. Within
    each byte, the bits are:

    - `status[5]`: rx_overrun
    - `status[4]`: led_up (maybe always up since it only reflects status to SFP+
      phy?)
    - `status[3]`: led_rx
    - `status[2]`: led_tx
    - `status[1]`: tx_afull
    - `status[0]`: tx_oflow

* `network/mcnt/rx`

    The 8 least significant bits of the received MCNTs on each interface all in
    one 32 bit register.

    - `rx[07:00]` is 8 LSbs of mcnt received on eth0
    - `rx[15:08]` is 8 LSbs of mcnt received on eth1
    - `rx[23:16]` is 8 LSbs of mcnt received on eth2
    - `rx[31:24]` is 8 LSbs of mcnt received on eth3

* `network/mcnt/rx0` to `network/mcnt/rx3`

    Contains the 32 least significant bits of the received MCNTs on each
    interface.

    - `rx0` is 32 LSbs of mcnt received on eth0
    - `rx1` is 32 LSbs of mcnt received on eth1
    - `rx2` is 32 LSbs of mcnt received on eth2
    - `rx3` is 32 LSbs of mcnt received on eth3

* `network/mcnt/tx`

    Contains the 32 LSbs of mcnt that is being sent over net interfaces.

* `network/pcnt`

    Each byte is a count (0-31) of packets buffered in each of the four packet
    buffers (one per 10 GbE core).  The low byte is eth0.

* `network/sowf/cnt0` to `network/sowf/cnt3`

    Received Start of Walsh Frame counters for each interface.  The "RX FIFO
    Reset" bit (network/ctrl[30]) resets the counters.

    - `cnt0` is count of SOWF rising edges received on eth0
    - `cnt1` is count of SOWF rising edges received on eth1
    - `cnt2` is count of SOWF rising edges received on eth2
    - `cnt3` is count of SOWF rising edges received on eth3

* `network/sync_count`

    Count of sync pulses sent to the X engines.  This register should increment
    exactly once per Walsh frame.

* `network/xid`

    Each byte is bits 12 down to 5 of the most recently received XID on each 10
    Gbe core.  The low byte is eth0.  This is essentially the same thing as
    bits 13 down to 6 of the most recently received channel number.  Bits 4
    down to 0 of the received XID should be constant for each 10 GbE core.

# Data Distribution

I think the channels going into the X engine on ROACH2 #0 (FID=0) will be:

    First 8 channels in parallel:   0   1   2   3   4   5   6   7
    Next  8 channels in parallel:  64  65  66  67  68  69  70  71
    Next  8 channels in parallel: 128 129 130 131 132 133 134 135
    And so on...

The channels for FID=1 will be the same pattern as for FID=0, but 8 channels
higher.  The channels for FID=2 will be the same pattern as for FID=0, but 16
channels higher.  And so on...

# Other Registers

This section describes other registers that are not specifically network
related.

* `source/ctrl`

    Control register for selecting/controlling F engine input sources.

    - `ctrl[31]`    = Arm noise source 1
    - `ctrl[30]`    = Arm noise source 0
    - `ctrl[29:18]` = Tone frequency 1 (units?)
    - `ctrl[17: 6]` = Tone frequency 0 (units?)
    - `ctrl[ 5: 3]` = Input selector 1
    - `ctrl[ 2: 0]` = Input selector 0

    Input selector values are:

    - `0` = All 0x00
    - `1` = All 0x80 (maybe not working as intended?)
    - `2` = ADC
    - `3` = Noise
    - `4` = Tone
    - `5` = Dither (noise+tone?)
    - `6` = All 0x00
    - `7` = All 0x00

* `source/seed0`

    Sets the seed of the noise generator 0.

* `source/seed1`

    Sets the seed of the noise generator 1.

* `sync/ext_pps_cnt`

    The count of external 1PPS pulses received (cannot be reset).

* `sync/ext_pps_period`

    The period between the two most recent external 1PPS pulses.

* `sync/ext_sowf_cnt`

    The count of external SOWF pulses received (cannot be reset).

* `sync/ext_sowf_period`

    The period between the two most recent external SOWF pulses.
