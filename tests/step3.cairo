use super::utils::{deploy_contract, Errors};
use counter::counter::{ICounterDispatcher, ICounterDispatcherTrait};
<<<<<<< HEAD
use snforge_std::{declare, cheatcodes::contract_class::ContractClassTrait};
use kill_switch::{IKillSwitchDispatcher, IKillSwitchDispatcherTrait};

#[test]
fn test_kill_switch_contract_actived() {
    let contract = declare("KillSwitch");
=======
use kill_switch::{IKillSwitchDispatcher, IKillSwitchDispatcherTrait};
use snforge_std::{declare, cheatcodes::contract_class::ContractClassTrait};


#[test]
fn test_kill_switch_contract_actived() {
    let contract = declare('KillSwitch');
>>>>>>> 06429e1 (adding step3)
    let constructor_args = array![true.into()];
    let contract_address = contract.deploy(@constructor_args).unwrap();

    let dispatcher = IKillSwitchDispatcher { contract_address };

    assert(dispatcher.is_active(), 'Kill Switch Activation failed');
}

#[test]
fn test_kill_switch_contract_deactivated() {
<<<<<<< HEAD
    let contract = declare("KillSwitch");
=======
    let contract = declare('KillSwitch');
>>>>>>> 06429e1 (adding step3)
    let constructor_args = array![false.into()];
    let contract_address = contract.deploy(@constructor_args).unwrap();

    let dispatcher = IKillSwitchDispatcher { contract_address };

    assert(!dispatcher.is_active(), 'Kill Switch Activation failed');
}

#[test]
fn test_counter_contract_with_kill_switch() {
    let initial_counter = 15;
    let contract_address = deploy_contract(initial_counter, true);
    let dispatcher = ICounterDispatcher { contract_address };

    assert(initial_counter == dispatcher.get_counter(), Errors::NOT_EQUAL);
}
