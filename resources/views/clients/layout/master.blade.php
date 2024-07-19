<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en-us">

<head>
    @include('clients.layout.partinals.head')
</head>

<body>
    <!-- navigation -->
    @include('clients.layout.partinals.header')
    <!-- /navigation -->

    @yield('body')

    <footer class="footer">
        @include('clients.layout.partinals.footer')
    </footer>


    {{-- link script --}}
    @include('clients.layout.partinals.script')
</body>

</html>
