/*
** EPITECH PROJECT, 2022
** minilibc
** File description:
** test_strstr
*/

#include <criterion/criterion.h>
#include <dlfcn.h>
#include <string.h>

int (*my_ffs)(int);

static void init_func(void)
{
	void *handle = dlopen("./libasm.so", RTLD_LAZY);

	my_ffs = dlsym(handle, "ffs");
}

Test(test_fss, test_0, .init = init_func)
{
	int my = my_ffs(0);
	int real = ffs(0);

	cr_assert_eq(my, real);
}

Test(test_fss, test_1, .init = init_func)
{
	int my = my_ffs(1);
	int real = ffs(1);

	cr_assert_eq(my, real);
}

Test(test_fss, test_2, .init = init_func)
{
	int my = my_ffs(2);
	int real = ffs(2);

	cr_assert_eq(my, real);
}

Test(test_fss, test_3, .init = init_func)
{
	int my = my_ffs(3);
	int real = ffs(3);

	cr_assert_eq(my, real);
}

Test(test_fss, test_8, .init = init_func)
{
	int my = my_ffs(8);
	int real = ffs(8);

	cr_assert_eq(my, real);
}

Test(test_fss, test_32, .init = init_func)
{
	int my = my_ffs(32);
	int real = ffs(32);

	cr_assert_eq(my, real);
}

Test(test_fss, test_64, .init = init_func)
{
	int my = my_ffs(64);
	int real = ffs(64);

	cr_assert_eq(my, real);
}

Test(test_fss, test_n64, .init = init_func)
{
	int my = my_ffs(-64);
	int real = ffs(-64);

	cr_assert_eq(my, real);
}

Test(test_fss, test_n2, .init = init_func)
{
	int my = my_ffs(-2);
	int real = ffs(-2);

	cr_assert_eq(my, real);
}

Test(test_fss, test_2147483648, .init = init_func)
{
	int my = my_ffs(2147483648);
	int real = ffs(2147483648);

	cr_assert_eq(my, real);
}