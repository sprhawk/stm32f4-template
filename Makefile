
# GCC_ROOT = $(HOME)/Developer/prjs/embedded/gcc-arm-none-eabi-4_9-2015q3/
# GNU_VERSION := 4.9.3
GCC_ROOT = $(HOME)/Developer/prjs/embedded/gcc-arm-none-eabi-7-2018-q2-update/
GNU_VERSION := 7.3.1
GNU_PREFIX := arm-none-eabi

OPENOCD_ROOT = $(HOME)/Developer/prjs/embedded/build/bin


# System libraries paths
SDK_ROOT = $(HOME)/Developer/prjs/embedded/stm32f4/STM32Cube_FW_F4_V1.8.0/
DRIVERS_ROOT = $(SDK_ROOT)Drivers/
HAL_DRIVER_ROOT = $(DRIVERS_ROOT)STM32F4xx_HAL_Driver/
CMSIS_ROOT = $(DRIVERS_ROOT)CMSIS/
BSP_ROOT = $(DRIVERS_ROOT)BSP/
MIDDLEWARE_ROOT = $(SDK_ROOT)Middlewares/

# Project source code path
PROJECT_ROOT = $(shell pwd)/
FIRMWARE_DIR = $(PROJECT_ROOT)firmware/
LINKER_SCRIPT = $(PROJECT_ROOT)system/stm32f407vg.ld

CFLAGS += -DSTM32F407xx # -DUSE_HAL_DRIVER
# CFLAGS += -O0 -g

# defined in stm32F4xx_conf.h
# CFLAGS += -DHS_VALUE=8000000

# project related
SEARCH_PATH += $(PWD)
C_SOURCE_FILES += main.c 

TARGET = main
OUTPUT_DIR = build/

# system and startup code
SEARCH_PATH += system
C_SOURCE_PATH += $(PROJECT_ROOT)system/ 
C_SOURCE_FILES += system_stm32f4xx.c stm32f4xx_it.c # stm32f4xx_hal_msp.c
ASM_SOURCE_PATH += $(PROJECT_ROOT)system/
ASM_SOURCE_FILES += startup_stm32f407xx.s

# stm32f4xx device related
SEARCH_PATH += $(CMSIS_ROOT)Include/
SEARCH_PATH += $(CMSIS_ROOT)Device/ST/STM32F4xx/Include/
C_SOURCE_PATH += $(sort $(dir $(shell find $(CMSIS_ROOT)DSP_Lib/ -iname "*.c" -print)))

# STM32F4-Discovery board related
SEARCH_PATH += $(BSP_ROOT)STM32F4-Discovery/
C_SOURCE_PATH += $(BSP_ROOT)STM32F4-Discovery/
C_SOURCE_FILES += stm32f4_discovery.c

# stm32f4xx HAL related
SEARCH_PATH += $(HAL_DRIVER_ROOT)Inc/
C_SOURCE_PATH += $(HAL_DRIVER_ROOT)Src/
# C_SOURCE_FILES += $(notdir $(shell find $(HAL_DRIVER_ROOT)Src/ -iname "*.c" -print)))
C_SOURCE_FILES += stm32f4xx_hal.c
# C_SOURCE_FILES += stm32f4xx_hal_adc.c
# C_SOURCE_FILES += stm32f4xx_hal_adc_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_can.c
# C_SOURCE_FILES += stm32f4xx_hal_cec.c
C_SOURCE_FILES += stm32f4xx_hal_cortex.c
# C_SOURCE_FILES += stm32f4xx_hal_crc.c
# C_SOURCE_FILES += stm32f4xx_hal_cryp.c
# C_SOURCE_FILES += stm32f4xx_hal_cryp_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_dac.c
# C_SOURCE_FILES += stm32f4xx_hal_dac_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_dcmi.c
# C_SOURCE_FILES += stm32f4xx_hal_dcmi_ex.c
C_SOURCE_FILES += stm32f4xx_hal_dma.c
# C_SOURCE_FILES += stm32f4xx_hal_dma2d.c
# C_SOURCE_FILES += stm32f4xx_hal_dma_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_dsi.c
# C_SOURCE_FILES += stm32f4xx_hal_eth.c
# C_SOURCE_FILES += stm32f4xx_hal_flash.c
# C_SOURCE_FILES += stm32f4xx_hal_flash_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_flash_ramfunc.c
# C_SOURCE_FILES += stm32f4xx_hal_fmpi2c.c
# C_SOURCE_FILES += stm32f4xx_hal_fmpi2c_ex.c
C_SOURCE_FILES += stm32f4xx_hal_gpio.c
# C_SOURCE_FILES += stm32f4xx_hal_hash.c
# C_SOURCE_FILES += stm32f4xx_hal_hash_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_hcd.c
C_SOURCE_FILES += stm32f4xx_hal_i2c.c
# C_SOURCE_FILES += stm32f4xx_hal_i2c_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_i2s.c
# C_SOURCE_FILES += stm32f4xx_hal_i2s_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_irda.c
# C_SOURCE_FILES += stm32f4xx_hal_iwdg.c
# C_SOURCE_FILES += stm32f4xx_hal_lptim.c
# C_SOURCE_FILES += stm32f4xx_hal_ltdc.c
# C_SOURCE_FILES += stm32f4xx_hal_ltdc_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_nand.c
# C_SOURCE_FILES += stm32f4xx_hal_nor.c
# C_SOURCE_FILES += stm32f4xx_hal_pccard.c
# C_SOURCE_FILES += stm32f4xx_hal_pcd.c
# C_SOURCE_FILES += stm32f4xx_hal_pcd_ex.c
C_SOURCE_FILES += stm32f4xx_hal_pwr.c
# C_SOURCE_FILES += stm32f4xx_hal_pwr_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_qspi.c
C_SOURCE_FILES += stm32f4xx_hal_rcc.c
# C_SOURCE_FILES += stm32f4xx_hal_rcc_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_rng.c
# C_SOURCE_FILES += stm32f4xx_hal_rtc.c
# C_SOURCE_FILES += stm32f4xx_hal_rtc_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_sai.c
# C_SOURCE_FILES += stm32f4xx_hal_sai_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_sd.c
# C_SOURCE_FILES += stm32f4xx_hal_sdram.c
# C_SOURCE_FILES += stm32f4xx_hal_smartcard.c
# C_SOURCE_FILES += stm32f4xx_hal_spdifrx.c
C_SOURCE_FILES += stm32f4xx_hal_spi.c
# C_SOURCE_FILES += stm32f4xx_hal_sram.c
# C_SOURCE_FILES += stm32f4xx_hal_tim.c
# C_SOURCE_FILES += stm32f4xx_hal_tim_ex.c
# C_SOURCE_FILES += stm32f4xx_hal_uart.c
# C_SOURCE_FILES += stm32f4xx_hal_usart.c
# C_SOURCE_FILES += stm32f4xx_hal_wwdg.c
# C_SOURCE_FILES += stm32f4xx_ll_fmc.c
# C_SOURCE_FILES += stm32f4xx_ll_fsmc.c
# C_SOURCE_FILES += stm32f4xx_ll_sdmmc.c
# C_SOURCE_FILES += stm32f4xx_ll_usb.c

# stm32f4xx Middlewares
# SEARCH_PATH += $(sort $(dir $(shell find $(MIDDLEWARE_ROOT)ST/ -iname "*.h" -print)))
# C_SOURCE_PATH += $(sort $(dir $(shell find $(MIDDLEWARE_ROOT)ST/ -iname "*.c" -print)))
# C_SOURCE_FILES += usbd_core.c usbd_ctlreq.c usbd_ioreq.c
# USB CDC
# C_SOURCE_FILES += usbd_cdc.c

include Makefile.config
