
function noise_core_config(this_block)

  % Revision History:
  %
  %   08-Jun-2012  (12:33 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /home/rprimian/git/design_files/noise_core.vhd
  %
  %

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('noise_core');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  %this_block.tagAsCombinational;

  this_block.addSimulinkInport('sync');
  this_block.addSimulinkInport('arm');
  this_block.addSimulinkInport('seed');

  this_block.addSimulinkOutport('sync_out');
  this_block.addSimulinkOutport('q0');
  this_block.addSimulinkOutport('q1');
  this_block.addSimulinkOutport('q2');
  this_block.addSimulinkOutport('q3');
  this_block.addSimulinkOutport('q4');
  this_block.addSimulinkOutport('q5');
  this_block.addSimulinkOutport('q6');
  this_block.addSimulinkOutport('q7');
  this_block.addSimulinkOutport('q8');
  this_block.addSimulinkOutport('q9');
  this_block.addSimulinkOutport('q10');
  this_block.addSimulinkOutport('q11');
  this_block.addSimulinkOutport('q12');
  this_block.addSimulinkOutport('q13');
  this_block.addSimulinkOutport('q14');
  this_block.addSimulinkOutport('q15');

  q0_port = this_block.port('q0');
  q0_port.setType('UFix_8_0');
  q1_port = this_block.port('q1');
  q1_port.setType('UFix_8_0');
  q10_port = this_block.port('q10');
  q10_port.setType('UFix_8_0');
  q11_port = this_block.port('q11');
  q11_port.setType('UFix_8_0');
  q12_port = this_block.port('q12');
  q12_port.setType('UFix_8_0');
  q13_port = this_block.port('q13');
  q13_port.setType('UFix_8_0');
  q14_port = this_block.port('q14');
  q14_port.setType('UFix_8_0');
  q15_port = this_block.port('q15');
  q15_port.setType('UFix_8_0');
  q2_port = this_block.port('q2');
  q2_port.setType('UFix_8_0');
  q3_port = this_block.port('q3');
  q3_port.setType('UFix_8_0');
  q4_port = this_block.port('q4');
  q4_port.setType('UFix_8_0');
  q5_port = this_block.port('q5');
  q5_port.setType('UFix_8_0');
  q6_port = this_block.port('q6');
  q6_port.setType('UFix_8_0');
  q7_port = this_block.port('q7');
  q7_port.setType('UFix_8_0');
  q8_port = this_block.port('q8');
  q8_port.setType('UFix_8_0');
  q9_port = this_block.port('q9');
  q9_port.setType('UFix_8_0');
  sync_out_port = this_block.port('sync_out');
  sync_out_port.setType('Bool');
  sync_out_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('arm').width ~= 1);
      this_block.setError('Input data type for port "arm" must have width=1.');
    end

    this_block.port('arm').useHDLVector(false);

    if (this_block.port('seed').width ~= 32);
      this_block.setError('Input data type for port "seed" must have width=32.');
    end

    if (this_block.port('sync').width ~= 1);
      this_block.setError('Input data type for port "sync" must have width=1.');
    end

    this_block.port('sync').useHDLVector(false);

  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk_1','ce_1')
   end  % if(inputRatesKnown)
  % -----------------------------

    % (!) Set the inout port rate to be the same as the first input 
    %     rate. Change the following code if this is untrue.
    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('noise_core.vhd');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------

