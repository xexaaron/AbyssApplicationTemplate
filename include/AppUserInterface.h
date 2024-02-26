#pragma once

#include "UI/UserInterface.h"
#include "UI/Components/Titlebar.h"
#include "UI/Components/DropDown.h"
#include "UI/Components/ComponentContainer.h"
#include "UI/Components/Button.h"
#include "UI/Components/TextBlock.h"
#include "UI/Components/Border.h"
#include "UI/Components/TextBlockInput.h"

class AppUserInterface final : public UserInterface {
public:
    AppUserInterface();
    ~AppUserInterface();
    void Render() override;
private:
};