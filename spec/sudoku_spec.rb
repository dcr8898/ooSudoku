require_relative 'spec_helper'

describe Sudoku do

  input_01    = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
  solution_01 = "145892673893176425276435819519247386762583194384961752957614238438729561621358947"

  input_02    = "--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3"
  solution_02 = "475936281932851764681274359517492836349768125268315497153687942794523618826149573"

  input_03    = "29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9"
  solution_03 = "293541687718296453654738912972813564846952371531467298369174825125389746487625139"

  input_04    = "-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-"
  solution_04 = "783426915946518327521379846658197234279643581134852769365984172417235698892761453"

  input_05    = "6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--"
  solution_05 = "648732915275189463319564827486325791927618354531947682864271539752893146193456278"

  input_06    = "---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----"
  solution_06 = "732689145846571329159324678413968257278135496695247831384756912521893764967412583"

  input_07    = "-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--"
  solution_07 = "239517864574268319168439275792846153381975426456123987843651792925784631617392548"

  input_08    = "-96-4---11---6---45-481-39---795--43-3--8----4-5-23-18-1-63--59-59-7-83---359---7"
  solution_08 = "396245781178369524524817396287951643931486275465723918712638459659174832843592167"

  input_09    = "----754----------8-8-19----3----1-6--------34----6817-2-4---6-39------2-53-2-----"
  solution_09 = "693875412145632798782194356357421869816957234429368175274519683968743521531286947"

  input_10    = "3---------5-7-3--8----28-7-7------43-----------39-41-54--3--8--1---4----968---2--"
  solution_10 ="387419526259763418641528379716285943594631782823974165472396851135842697968157234"

  input_11    = "3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-"
  solution_11 = "382619475594738621176425938863941752457263189921857364738594216245176893619382547"

  input_12    = "-2-5----48-5--------48-9-2------5-73-9-----6-25-9------3-6-18--------4-71----4-9-"

  input_13    = "--7--8------2---6-65--79----7----3-5-83---67-2-1----8----71--38-2---5------4--2--"

  input_14    = "----------2-65-------18--4--9----6-4-3---57-------------------73------9----------"

  input_16    = "8----------36------7--9-2---5---7-------457-----1---3---1----68--85---1--9----4--"
  solution_16 = "812753649943682175675491283154237896369845721287169534521974368438526917796318452"

  describe "#board_loader" do
    it "properly loads init_board" do
      sudoku = Sudoku.new(input_01)
      expect(
        sudoku.send(:board_loader, input_02, Array.new(81) { "123456789" }).join
      ).to eq(solution_02)
    end
  end

end
