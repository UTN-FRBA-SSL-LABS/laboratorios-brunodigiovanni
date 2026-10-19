#include "String.h"

int IsEmpty(const char *s) {
    return *s == '\0';
}

int GetLength(const char *s) {
    if (IsEmpty(s))
        return 0;
    return 1 + GetLength(s + 1);
}

int AreEqual(const char *s1, const char *s2) {
    while (!IsEmpty(s1) && !IsEmpty(s2)) {
        if (*s1 != *s2)
            return 0;
        s1++;
        s2++;
    }
    return IsEmpty(s1) && IsEmpty(s2);
}

int AreDecimalDigits(const char *s) {
    if (IsEmpty(s)) return 0;
    for (const char *p = s; !IsEmpty(p); p++)
        if (*p < '0' || *p > '9')
            return 0;
    return 1;
}

int Contains(const char *s, char c) {
    for (const char *p = s; !IsEmpty(p); p++) {
        if (*p == c)
            return 1;
    }
    return 0;
}