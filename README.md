# Route Transitions

Custom route transitions.
This package helps in handling transitions between screens.

## Example

```
    RouteTransitions(
        context: context,                             // BuildContext
        child: const Page1(),                         // Page Widget
        animation: AnimationType.fadeIn,              // AnimationType
        duration: const Duration(milliseconds: 600),  // Duration
        replacement: true,                            // Navigation.pushReplacement
    );
```