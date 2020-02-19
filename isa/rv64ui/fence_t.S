# See LICENSE for license details.

#*****************************************************************************
# fence_i.S
#-----------------------------------------------------------------------------
#
# Test self-modifying code and the fence.i instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

li x1, 2

.align 12
l1:
  j l2
.align 12
l2:
  j l3
.align 12
l3:
  j l4
.align 12
l4:
  j l5
.align 12
l5:
  j l6
.align 12
l6:
  j l7
.align 12
l7:
  .word 0x00fff00b
  addi x1, x1, -1
  bnez x1, l1

TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

insn:
  addi a3, a3, 333

RVTEST_DATA_END
