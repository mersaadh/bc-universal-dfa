# bc-universal-dfa

**bc-universal-dfa** is a minimalist Universal Deterministic Finite Automaton *(DFA)* in **bc (POSIX Basic Calculator)**

## 1. Tutorial

### 1.1 Load the simulator

```bash
bc machine.bc
```

### 1.2. Define your Automaton (EX: ``1*0*1*``)

```c
create_machine(4, 2)

define_start_node(0)
define_accept(0)
define_accept(1)
define_accept(2)

/* Transitions */
define_state(1, 0, 0)
define_state(0, 0, 1)
define_state(0, 1, 1)
define_state(1, 1, 2)
define_state(1, 2, 2)
define_state(0, 2, 3)
define_state(0, 3, 3)
define_state(1, 3, 3)
```

### 1.3. Test a simulation

```c
begin_input()
d(1); d(0); d(1);
end_input()

run_machine()
```
