/*
** EPITECH PROJECT, 2022
** minilibc
** File description:
** test_strstr
*/

#include <criterion/criterion.h>
#include <dlfcn.h>
#include <string.h>

char *(*my_strstr)(const char *, const char *);

static void init_func(void)
{
	void *handle = dlopen("./libasm.so", RTLD_LAZY);

	my_strstr = dlsym(handle, "strstr");
}

Test(test_strstr, is_in, .init = init_func)
{
	char *my = my_strstr(strdup("zabcdefgh"), "abc");
	char *real = strstr(strdup("zabcdefgh"), "abc");

	cr_assert_str_eq(my, real);
}

Test(test_strstr, is_in2, .init = init_func)
{
	char *my = my_strstr(strdup("zabdefabcgh"), "abc");
	char *real = strstr(strdup("zabdefabcgh"), "abc");

	cr_assert_str_eq(my, real);
}

Test(test_strstr, is_not_in, .init = init_func)
{
	char *my = my_strstr(strdup("zabcdefgh"), "aze");
	char *real = strstr(strdup("zabcdefgh"), "aze");

	cr_assert(my == real);
}

Test(test_strstr, not, .init = init_func)
{
    char *my = my_strstr(strdup(""), "");
    char *real = strstr(strdup(""), "");

    cr_assert_str_eq(my, real);
}

Test(test_strstr, not2, .init = init_func)
{
    char *my = my_strstr(strdup("d"), "");
    char *real = strstr(strdup("d"), "");

    cr_assert_str_eq(my, real);
}

Test(test_strstr, yes2, .init = init_func)
{
    char *my = my_strstr(strdup("dddda"), "dd");
    char *real = strstr(strdup("dddda"), "dd");

    cr_assert_str_eq(my, real);
}

Test(test_strstr, yes3, .init = init_func)
{
    char *my = my_strstr(strdup("dddda"), "dd");
    char *real = strstr(strdup("dddda"), "dd");

    cr_assert_str_eq(my, real);
}

Test(test_strstr, yes4, .init = init_func)
{
    char *my = my_strstr(strdup("dddda"), "dddda");
    char *real = strstr(strdup("dddda"), "dddda");

    cr_assert_str_eq(my, real);
}

Test(test_strstr, no3, .init = init_func)
{
    char *my = my_strstr(strdup("dddd"), "dddda");
    char *real = strstr(strdup("dddd"), "dddda");

    cr_assert(my == real);
}