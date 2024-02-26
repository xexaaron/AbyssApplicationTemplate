#include <iostream>
#include "Core/Core.h"
#include "include/AppUserInterface.h"

int main() {
    AppUserInterface AppInterface;
    std::unique_ptr<Application> App = std::make_unique<Application>("Application", &AppInterface);
    int ProgResult = (int)App->ApplicationLoop();
    printf("Program Result : %i\n", ProgResult);
    return ProgResult;
}