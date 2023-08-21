<?php
include("conexion/conexion_bd.php");
?>
import React from 'react';
import '../../Componentes/Login/login.css'
import '../../Componentes/Login/login_responsive.css'
import '../../App.css'
import { Link } from 'react-router-dom'

// Importacion de assets
import video from '../../Assets/Login/videoLogin.mp4'
import image from '../../Assets/Login/image.png'

// Importacion de iconos
import { FaUserShield } from 'react-icons/fa'
import { BsFillShieldLockFill } from 'react-icons/bs'
import { AiOutlineSwapRight } from 'react-icons/ai'

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <div className='loginPage flex'>
    <div className="container-login flex">
      {/* Panel de video */}
      <div className="videoDiv">
        <video src={video} autoPlay muted loop className='videoLogin'></video>

        <div className="textDiv">
          <h2 className='titulo'>SubGerencia de Transportes</h2>
          <p>Sistema de consultas de transportes</p>
        </div>
      </div>

      {/* panel del formulario */}
      <div className="formDiv flex">
        {/* logo */}
        <div className="headerDiv">
          <img src={image} alt="imagen de mde" />
          <h3>Bienvenido</h3>
        </div>

        {/* formulario */}
        <form action="" className='form grid'>
          <span className='mostrarMensaje'>Estado de logeo - aquí</span>

          <div className="inputDiv">
            <label htmlFor="username">Usuario</label>
            <div className="input flex">
              <FaUserShield className='icon-input icon' />
              <input type='text' id='username' placeholder='Ingrese su usuario' />
            </div>
          </div>

          <div className="inputDiv">
            <label htmlFor="password">Contraseña</label>
            <div className="input flex">
              <BsFillShieldLockFill className='icon-input icon' />
              <input type='password' id='password' placeholder='Ingrese su contraseña' />
            </div>
          </div>

          <button type='submit' className='btn-form btn flex'>
            <span>Iniciar Sesión</span>
            <AiOutlineSwapRight className='btn-icon icon' />
          </button>

        </form>
      </div>
    </div>
  </div>

</body>

</html>



export default Login