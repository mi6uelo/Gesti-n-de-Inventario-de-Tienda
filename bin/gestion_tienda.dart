import 'dart:io'; // Para la entrada del usuario
import 'package:gestion_tienda/gestion_tienda.dart';

void main() {
  Inventario inventario = Inventario();
  bool continuar = true;

  while (continuar) {
    print('\n--- MENÚ DE INVENTARIO ---');
    print('1. Agregar producto');
    print('2. Buscar producto por nombre');
    print('3. Buscar productos por categoría');
    print('4. Actualizar cantidad en stock de un producto');
    print('5. Calcular valor total del inventario');
    print('6. Mostrar productos por categoría');
    print('7. Salir');
    print('Seleccione una opción (1-7):');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        agregarProductoMenu(inventario);
        break;
      case '2':
        buscarProductoPorNombreMenu(inventario);
        break;
      case '3':
        buscarProductosPorCategoriaMenu(inventario);
        break;
      case '4':
        actualizarStockMenu(inventario);
        break;
      case '5':
        double valorTotal = inventario.calcularValorTotalInventario();
        print('El valor total del inventario es: \$$valorTotal');
        break;
      case '6':
        mostrarProductosPorCategoriaMenu(inventario);
        break;
      case '7':
        continuar = false;
        print('Saliendo del programa...');
        break;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  }
}

// Función para agregar un producto
void agregarProductoMenu(Inventario inventario) {
  print('\n--- Agregar Producto ---');

  stdout.write('Ingrese el nombre del producto: ');
  String? nombre = stdin.readLineSync();

  stdout.write('Ingrese el precio del producto: ');
  double? precio = double.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Ingrese la cantidad en stock: ');
  int? cantidad = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Ingrese la categoría del producto: ');
  String? categoria = stdin.readLineSync();

  if (nombre != null &&
      precio != null &&
      cantidad != null &&
      categoria != null) {
    inventario.agregarProducto(Producto(
      nombre: nombre,
      precio: precio,
      cantidadEnStock: cantidad,
      categoria: categoria,
    ));
  } else {
    print('Error al ingresar los datos. Intente nuevamente.');
  }
}

// Función para buscar un producto por nombre
void buscarProductoPorNombreMenu(Inventario inventario) {
  print('\n--- Buscar Producto por Nombre ---');

  stdout.write('Ingrese el nombre del producto: ');
  String? nombre = stdin.readLineSync();

  if (nombre != null && nombre.isNotEmpty) {
    inventario.buscarPorNombre(nombre);
  } else {
    print('Debe ingresar un nombre válido.');
  }
}

// Función para buscar productos por categoría
void buscarProductosPorCategoriaMenu(Inventario inventario) {
  print('\n--- Buscar Productos por Categoría ---');

  stdout.write('Ingrese la categoría: ');
  String? categoria = stdin.readLineSync();

  if (categoria != null && categoria.isNotEmpty) {
    inventario.buscarPorCategoria(categoria);
  } else {
    print('Debe ingresar una categoría válida.');
  }
}

// Función para actualizar el stock de un producto
void actualizarStockMenu(Inventario inventario) {
  print('\n--- Actualizar Stock de Producto ---');

  stdout.write('Ingrese el nombre del producto: ');
  String? nombre = stdin.readLineSync();

  stdout.write('Ingrese la nueva cantidad en stock: ');
  int? cantidad = int.tryParse(stdin.readLineSync() ?? '');

  if (nombre != null && nombre.isNotEmpty && cantidad != null) {
    inventario.actualizarStock(nombre, cantidad);
  } else {
    print('Debe ingresar un nombre y una cantidad válida.');
  }
}

// Función para mostrar productos por categoría
void mostrarProductosPorCategoriaMenu(Inventario inventario) {
  print('\n--- Mostrar Productos por Categoría ---');

  stdout.write('Ingrese la categoría: ');
  String? categoria = stdin.readLineSync();

  if (categoria != null && categoria.isNotEmpty) {
    inventario.mostrarProductosPorCategoria(categoria);
  } else {
    print('Debe ingresar una categoría válida.');
  }
}
