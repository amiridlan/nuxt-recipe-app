<template>
  <UCard>
    <template #header>
      <USkeleton class="h-64 w-full" />
    </template>

    <div class="space-y-4">
      <USkeleton class="h-6 w-3/4" />
      <div class="flex gap-4">
        <USkeleton class="h-4 w-24" />
        <USkeleton class="h-4 w-24" />
      </div>
      <div class="flex gap-2">
        <USkeleton class="h-6 w-16" />
        <USkeleton class="h-6 w-16" />
        <USkeleton class="h-6 w-16" />
      </div>
    </div>

    <template #footer>
      <USkeleton class="h-12 w-full" />
    </template>
  </UCard>
</template>