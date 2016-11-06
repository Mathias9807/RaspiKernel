#ifndef _KERNEL_H
#define _KERNEL_H


// Base addresses
#ifdef BCM2836
#define PER_ADDR		0x3f000000
#define PER_ADDR_MAX		0x3fffffff
#elif BCM2835
#define PER_ADDR		0x20000000
#define PER_ADDR_MAX		0x20ffffff
#else
#error				"Unspecified chip"
#endif

// GPIO addresses
#define GPIO_ADDR		(PER_ADDR + 0x200000)
#define GPIO_BITS_PER_PIN	3

#ifdef BCM2836
#define GPIO_SET0		0x1c
#define GPIO_SET1		0x20
#define GPIO_CLR0		0x28
#define GPIO_CLR1		0x2c
#elif BCM2835
#define GPIO_SET0		0x28
#define GPIO_SET1		0x2c
#define GPIO_CLR0		0x1c
#define GPIO_CLR1		0x20
#endif

#define GPIO_ACT		47
#define GPIO_ACT_BYTE_SET	16
#define GPIO_ACT_PIN_OFFS	7

// Timer addresses
#define TIMER_ADDR		(PER_ADDR + 0x3000)
#define TIMER_CTRL		(TIMER_ADDR)
#define TIMER_COUNTER		(TIMER_ADDR + 0x04)
#define TIMER_REG0		(TIMER_ADDR + 0x0C)
#define TIMER_REG1		(TIMER_ADDR + 0x10)
#define TIMER_REG2		(TIMER_ADDR + 0x14)
#define TIMER_REG3		(TIMER_ADDR + 0x18)


// Read/Write memory functions
static inline void	set32(volatile uintptr_t address, volatile uint32_t value);
static inline uint32_t	get32(volatile uintptr_t address);
static inline void	set64(volatile uintptr_t address, volatile uint64_t value);
static inline uint64_t	get64(volatile uintptr_t address);

// Sleep functions
static inline void sleep_us(volatile uint64_t time);
static inline void sleep_s(float time);


#endif // _KERNEL_H
