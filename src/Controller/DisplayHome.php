<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/', name: 'home', methods: ['GET'])]

class DisplayHome extends AbstractController
{
    public function __invoke()
    {
        return $this->render('base.html.twig');
    }
}